describe("Add to Cart", () => {
  it("should add the product to the cart and increase the cart total", () => {
    cy.visit("/");
    cy.contains("Welcome to The Jungle");
    cy.get(".products article").should("have.length", 2);
    cy.get(".products article").first();
    cy.get("button").contains("Add").click();
    cy.contains("My Cart (1)");
  });
  it("should add a product to the cart from the product page", () => {
    cy.visit("/");
    cy.get(".products article").should("have.length", 2);
    cy.get(".products article").first().click();
    cy.get(".quantity span").contains("in stock at");
    cy.get("button").contains("Add").click();
    cy.contains("My Cart (1)");
  });
});
