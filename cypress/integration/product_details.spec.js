describe('example to-do app', () => {
  beforeEach(() => {
    // Cypress starts out with a blank slate for each test
    // so we must tell it to visit our website with the `cy.visit()` command.
    // Since we want to visit the same URL at the start of all our tests,
    // we include it in our beforeEach function so that it runs before each test
    // cy.request('/cypress_rails_reset_state')
    cy.visit('/')
  })

  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });
  
  it("There be a certain description on the page", () => {
  cy.get(".products article").first().click().then(()=>{
    cy.contains("The Scented Blade is an extremely rare").should("be.visible")
    // cy.get("p").should("have.text","The Scented Blade is an extremely rare");
  });
  

});
})