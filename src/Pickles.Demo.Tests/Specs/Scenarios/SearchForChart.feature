Feature: Search For  Chart
	In order to find the pages I want to view  
	As a user of the Admiralty site  
	I want to be able to search from the homepage  

Background:
	Given I have accessed the Admiralty homepage

@ignore @NotTested
Scenario: Search - Homepage - Chart
	When I enter 'Chart' as the search term
	Then the results page should display correctly