describe("Add to Cart", () => {
  it("There is products on the page", () => {
    cy.visit("/")
    cy.contains("Welcome to The Jungle")
    cy.get(".products article").should("have.length", 2);
  });
})