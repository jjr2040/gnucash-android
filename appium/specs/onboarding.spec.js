const caps = require('../helpers/caps');
const webdriverio = require('webdriverio');
const selectorById = require('../helpers/utils').selectorById;
const androidSelectorById = require('../helpers/utils').androidSelectorById;
const compareAndSaveScreenshot = require('../helpers/utils').compareAndSaveScreenshot;

jest.setTimeout(30000);

describe('Onboarding', () => {

  let client;
  let currentPackage;

  beforeAll(async () => {
    client = await webdriverio.remote(caps);
    currentPackage = await client.getCurrentPackage();    
  });

  afterAll( async () => {
    await client.deleteSession();
  });

  test('App has next button', async () => {
    const resourceId = 'btn_save';
    const selector = selectorById(currentPackage, resourceId);

    const button = await client.$(selector);

    const isDisplayed = await button.isDisplayed();

    await compareAndSaveScreenshot(client, 'onboarding-greetings.png');
    
    expect(isDisplayed).toBe(true);
  });

  test('Can go to default currency page', async () => {

    const nextButton = await client.$(selectorById(currentPackage, 'btn_save'));

    await nextButton.click();
    
    const title = await client.$(androidSelectorById('title'));
    const text = await title.getText();

    await compareAndSaveScreenshot(client, 'onboarding-select-currency.png');

    expect(text).toBe('Default Currency');
  });

  test('Select currency', async () => {

    const nextButton = await client.$(selectorById(currentPackage, 'btn_save'));

    await nextButton.click();

    const title = await client.$(androidSelectorById('title'));
    const text = await title.getText();

    await compareAndSaveScreenshot(client, 'onboarding-account-setup.png');

    expect(text).toBe('Account Setup');
  });

  test('Select account setup', async () => {

    const nextButton = await client.$(selectorById(currentPackage, 'btn_save'));

    await nextButton.click();

    const title = await client.$(androidSelectorById('title'));
    const text = await title.getText();

    await compareAndSaveScreenshot(client, 'onboarding-feedback-options.png');

    expect(text).toBe('Feedback Options');
  });

  test('Select review step', async () => {

    const nextButton = await client.$(selectorById(currentPackage, 'btn_save'));

    await client.touchAction({
      action: 'tap',
      x: 500,
      y: 600
    });

    await nextButton.click();

    const title = await client.$(androidSelectorById('title'));
    const text = await title.getText();

    await compareAndSaveScreenshot(client, 'onboarding-review.png');

    expect(text).toBe('Review');
    
    const reviewNextButton = await client.$(selectorById(currentPackage, 'btn_save'));

    await reviewNextButton.click();
  });

  test('Create transaction', async () => {
    const dismissButton = await client.$(androidSelectorById(currentPackage, 'button1'));

    await dismissButton.click();

    await client.touchAction({
      action: 'tap',
      x: 500,
      y: 700
    });
    
    const createTransaction = await client.$(selectorById(currentPackage, 'create_transaction'));

    await createTransaction.click();

    const descriptionTextField = await client.$(selectorById(currentPackage, 'input_transaction_name'));

    await descriptionTextField.addValue('Test transaction');

    const inputTransactionAmount = await client.$(selectorById(currentPackage, 'input_transaction_amount'));

    await inputTransactionAmount.addValue('1000');

    await compareAndSaveScreenshot(client, 'create-transaction.png');

    const menuSave = await client.$(selectorById(currentPackage, 'menu_save'));

    await menuSave.click();

    const accountBalance = await client.$(selectorById(currentPackage, 'account_balance'));

    const accountBalanceText = await accountBalance.getText();

    expect(accountBalanceText).toBe('-$1000.00');

    await client.back();
  }); 

  test('Recents', async () => {

    await client.touchAction({
      action: 'tap',
      x: 200,
      y: 300
    });

    const searchButton = await client.$(selectorById(currentPackage, 'menu_search'));

    await searchButton.click();

    const searchTextFiled = await client.$(selectorById(currentPackage, 'search_src_text'));

    await searchTextFiled.addValue('open');

    await searchTextFiled.addValue('a');

    const createTransaction = await client.$(selectorById(currentPackage, 'create_transaction'));

    const createTransactionIsDisplayed = await createTransaction.isDisplayed();

    expect(createTransactionIsDisplayed).toBe(true);
    
  });

  // test('Search account', async () => {
    // const title = await client.$(androidSelectorById('title'));
    // const text = await title.getText();

    // await compareAndSaveScreenshot(client, 'onboarding-review.png');

    // expect(text).toBe('Review');
    
    // const reviewNextButton = await client.$(selectorById(currentPackage, 'btn_save'));

    // await reviewNextButton.click();
  // });

});