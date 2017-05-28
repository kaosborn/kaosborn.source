Title: Publishing a NuGet package locally
Published: 5/27/2017
Tags:
 - NuGet
 - NetStandard
---
Using [NuGet](https://nuget.org) is a great way to publically distribute .NET libraries.
For distribution of private libraries, another endpoint is required.
This paper describes how to build and distribute a .NET Standard library on a local file share.

### Prerequisites

Install any version Visual Studio 2017.
This installation will include NuGet 4 so installing NuGet explicitly is not advised.

### Build a .NET Standard library

Create a new Class Library project from the .NET Standard choices.
Edit the project properties Package tab for library-specific values.
Be sure to specify a package version.
Check **Generate NuGet package on build** to automatically generate a .nupkg file.
Alternatively, the .nupkg file can be generated from a VS command prompt from the .csproj directory:

`msbuild /t:pack /p:Configuration=Release`

If successful, this file will be created:

`bin\Release\<PackageId>.<PackageVersion>.nupkg`

### Create a local NuGet package source

In Visual Studio 2017, open the Tools > Options dialog
and select the NuGet Packages > Package Sources tab.
Click Add, input the source folder and a friendly name, and click Update.
For better performance, use the up arrow to place the local package sources first.
On the General tab, choose Packages.config as the default format.

### Store in a local NuGet repository

Now use a VS command prompt to store the .nupkg file in the directory specified
as the source folder given above:

`nuget add bin\Release\<PackageId>.<PackageVersion>.nupkg -source <sourceFolder>`

And now the package is ready to be installed using the Manage NuGet packages dialog
for a Visual Studio project.

### Additional reading

Care must be taken to avoid documentation written for versions of Visual Studio older than 2017.
Here is some current documentation:

* docs.microsoft.com/en-us/nuget/guides/create-net-standard-packages-vs2017
* docs.microsoft.com/en-us/nuget/hosting-packages/local-feeds
