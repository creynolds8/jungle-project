describe("Product details", () => {
  it("visits the product details page for a particular product", () => {
    cy.visit("/");
    cy.get(".products article").should("have.length", 2);
    cy.get(".products article").first().click();
    cy.get(".quantity span").contains("in stock at");
  });
  it("visits the product details page for a different product", () => {
    cy.visit("/");
    cy.get(".products article").should("have.length", 2);
    cy.get(".products article").last().click();
    cy.get(".quantity span").contains("in stock at");
  });
});
