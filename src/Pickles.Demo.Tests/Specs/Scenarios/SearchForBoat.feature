Feature: Search For Boat
	In order to find the pages I want to view  
	As a user of the Admiralty site  
	I want to be able to search from the homepage  

Background:
	Given I have accessed the Admiralty homepage

@Search @AutomatedUI
Scenario: Search - Homepage - Boat
	When I enter 'Boat' as the search term
	Then the results page should display correctly