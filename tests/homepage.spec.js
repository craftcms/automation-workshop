import { test, expect } from "@playwright/test";

test("test", async ({ page }) => {
  // Go to https://applefakenews.com/
  await page.goto("https://applefakenews.com/");

  // Click text=This is an important Fake News post!
  await page.locator("text=This is an important Fake News post!").click();
  await expect(page).toHaveURL(
    "https://applefakenews.com/news/this-is-an-important-fake-news-post"
  );

  await expect(
    page.locator('text=/.*"Shiny Brad saved my life!".*/')
  ).toBeVisible();
});

test("healthcheck", async ({ page }) => {
  const response = await page.goto(
    "https://applefakenews.com/actions/app/health-check"
  );
  await expect(response.ok()).toBeTruthy();
});
