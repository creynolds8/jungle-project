describe("User functionality", () => {
  it("should login with the correct credentials", () => {
    cy.visit("/");
    cy.get(".products article").should("have.length", 2);
    cy.get("a.nav-link").contains("Login").click();
    cy.contains("Email:");
    cy.get("input[name=email]").type("test@test.com");
    cy.get("input[name=password").type("TESTTEST");
    cy.get("input[value=Login]").click({ force: true });
    cy.contains("Logout");
  });
  it("should signup and be automatically logged in with those credentials", () => {
    cy.visit("/")
    cy.get(".products article").should("have.length", 2);
    cy.get("a.nav-link").contains("Signup").click();
    cy.get("input[id=user_name]").type("New User");
    cy.get("input[id=user_email").type("newuser@email.com");
    cy.get("input[id=user_password]").type("newuser1");
    cy.get("input[id=user_password_confirmation").type("newuser1");
    cy.get("input[value='Signup!']").click({ force: true });
    cy.contains("New User")
  })
});
