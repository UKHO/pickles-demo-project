using NUnit.Framework;
using TechTalk.SpecFlow;

namespace Pickles.Demo.Tests.Steps
{
    [Binding]
    public sealed class StepDefinition
    {
        [Given(@"I have accessed the Admiralty homepage")]
        public void GivenIHaveAccessedTheAdmiraltyHomepage()
        {
            //Nothing to see here
        }

        [When(@"I enter '(.*)' as the search term")]
        public void WhenIEnterAsTheSearchTerm(string searchTerm)
        {
            if (searchTerm == "Boat")
            {
                Assert.Fail("Boat has failed!");
            }
        }

        [Then(@"the results page should display correctly")]
        public void ThenTheResultsPageShouldDisplayCorrectly()
        {
            Assert.Pass("All good here!");
        }
    }
}
