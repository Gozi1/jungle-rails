describe('example to-do app', () => {
  beforeEach(() => {
    // Cypress starts out with a blank slate for each test
    // so we must tell it to visit our website with the `cy.visit()` command.
    // Since we want to visit the same URL at the start of all our tests,
    // we include it in our beforeEach function so that it runs before each test
    cy.visit('/')
  })

  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });
  
  it("Confirms that the count of the cart button changes when adding products to it ", () => {
  cy.contains(".btn","Add").first().click({force:true}).then(()=>{
    cy.contains("li", "(1)").should("be.visible")
  });
  

});
})