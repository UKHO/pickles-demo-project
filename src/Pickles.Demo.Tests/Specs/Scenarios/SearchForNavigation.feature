Feature: Search For Navigation
	In order to find the pages I want to view  
	As a user of the Admiralty site  
	I want to be able to search from the homepage  	

Background:
	Given I have accessed the Admiralty homepage

@Search @AutomatedUI
Scenario: Search - Homepage - Navigation
	When I enter 'Navigation' as the search term
	Then the results page should display correctly