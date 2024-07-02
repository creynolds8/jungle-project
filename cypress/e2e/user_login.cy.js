describe("User functionality", () => {
  it("should login with the correct credentials", () => {
    cy.visit("/")
    cy.get(".products article").should("have.length", 2);
    cy.get("a.nav-link").contains("Login").click();
    cy.contains("Email:")
    cy.get("input[name=email]").type("test@test.com")
    cy.get("input[name=password").type("TESTTEST")
    cy.get("input[value=Login]").click({force: true});
    cy.contains("Logout")
  })
})