# Pickles Demo Project

This is a demo project to show what Pickles can do and how to implement it within an Azure DevOps pipeline.

## What is Pickles?

*"Pickles is a Living Documentation generator: it takes your Specification (written in Gherkin, with Markdown descriptions) and turns them into an always up-to-date documentation of the current state of your software - in a variety of formats."* - [PicklesDoc](http://www.picklesdoc.com/)

## Why implement Pickles?

There are several reason to expose your feature files using Pickles:

* To increase stakeholder confidence by exposing specification tests
* To actually use Gherkin the way it is intended - as _Living Documentation_ of the system
* Easy to implement, can be added to existing build pipeline

## How to implement Pickles into your pipeline

The steps below will enable you to implement Pickles into your pipeline:

  1. Install **Pickles.CommandLine** NuGet Package into the required project (*version 2.20.1*)
  2. Incorporate the following command line argument into your existing pipeline via a task or within the YAML file (or create a separate pipeline for Pickles)

    {Package Folder Location}\\Pickles.CommandLine.2.20.1\\tools\\pickles.exe ^
    --feature-directory={Location of features within project} ^
    --output-directory={Location to output the pickled features} ^
    --system-under-test-name="{The project name}" ^
    --system-under-test-version={Version of the system (if needed)} ^
    --documentation-format=dhtml

For more information refer to the PicklesDocs [Arguments](http://docs.picklesdoc.com/en/latest/Arguments/) section.

Example:

	$(System.DefaultWorkingDirectory)\\src\\packages\\Pickles.CommandLine.2.20.1\\tools\\pickles.exe ^
	--feature-directory=\$(System.DefaultWorkingDirectory)\\src\\Pickles.Demo.Tests\\ ^
	--output-directory=\$(System.DefaultWorkingDirectory)\\src\\Pickles.GeneratedDocumentation ^
	--system-under-test-name="Pickles Demo Project" ^
	--system-under-test-version=2.0.1beta ^
	--documentation-format=dhtml

 3.  Create a step to publish the output files to the pipeline for visibility.
 
 Example: 

    - task: PublishBuildArtifacts@1
      inputs:
        PathtoPublish: '$(System.DefaultWorkingDirectory)\\src\\Pickles.GeneratedDocumentation'
        ArtifactName: 'drop'
        publishLocation: 'Container'
      displayName: Publish Pickles Artifact  

 4.  UKHO Only - Create a step to copy the output files to Azure Blob Storage.

 Example:

    - task: AzureFileCopy@3
      inputs:
        SourcePath: '$(System.DefaultWorkingDirectory)\src\Pickles.GeneratedDocumentation'
        azureSubscription: '<your azure subscription>'
        Destination: 'AzureBlob'
        storage: '<your Azure storage account>'
        ContainerName: '$web/$(Build.Repository.Name)'
      displayName: Publish Pickles Artifact to Azure Blob Storage
 
 5. Your features are now pickled... so add a link to the generated index.html file from a dashboard or location of your choice and make your features visible :smiley:
 
A fully implemented example with a YAML pipeline can be seen [here](https://github.com/UKHO/pickles-demo-project/blob/master/azure-pipelines.yml).

For further info refer to [Pickles documentation](http://docs.picklesdoc.com/en/latest/).
