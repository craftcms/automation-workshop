import { test, expect } from '@playwright/test';
test('test', async ({ page }, testInfo) => {
  // Go to https://applefakenews.com/
  await page.goto('https://applefakenews.com/');
  // Click text=Tim Kelty owns stock in GitKraken (Tower competitor), under SEC investigation fo
  await page
    .locator(
      'text=Tim Kelty owns stock in GitKraken (Tower competitor), under SEC investigation fo'
    )
    .click();
  await expect(page).toHaveURL(
    'https://applefakenews.com/news/tim-kelty-owns-stock-in-gitkraken-tower-competitor-under-sec-investigation-for-making-false-or-misleading-statements-about-a-company-including-in-sec-filings'
  );

  await expect(page.locator('h2:has-text("BOOO TOWER, BOOOO!")')).toBeVisible();
  await testInfo.attach('article', {
    body: await page.screenshot({ fullPage: true }),
    contentType: 'image/png',
  });
});
