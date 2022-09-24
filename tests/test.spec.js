import { test, expect } from "@playwright/test";

test("article", async ({ page }, testInfo) => {
  // Go to https://applefakenews.com/
  await page.goto("https://applefakenews.com/");

  await testInfo.attach("home", {
    body: await page.screenshot({ fullPage: true }),
    contentType: "image/png",
  });

  // Click text=This is an important Fake News post!
  await page.locator("text=This is an important Fake News post!").click();
  await expect(page).toHaveURL(
    "https://applefakenews.com/news/this-is-an-important-fake-news-post"
  );

  await expect(
    page.locator('text=/.*"Shiny Brad saved my life!".*/')
  ).toBeVisible();

  await testInfo.attach("article", {
    body: await page.screenshot({ fullPage: true }),
    contentType: "image/png",
  });
});

test("healthcheck", async ({ page }) => {
  const response = await page.goto(
    "https://applefakenews.com/actions/app/health-check"
  );
  await expect(response.ok()).toBeTruthy();
});
