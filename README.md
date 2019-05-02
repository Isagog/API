# Isagog API Client Generator

Generate the client of the Isagog API.

## Getting Started

### Requirements

* Install `Homebrew`:
```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"

```

* Install `OpenAPI Generator`:
```bash
brew install openapi-generator
```

### Resources

Download the OpenAPI YAML files that define the APIs of the following modules:

* `KS`: Download the YAML file [here](https://github.com/Isagog/KnowledgeService) 
and put it under the root of this project as `isagog-ks.yaml`

* `DQA`: Download the YAML file [here](https://github.com/Isagog/DQA) 
and put it under the root of this project as `isagog-dqa.yaml`

* `Dialog Manager`: Download the YAML file [here](https://github.com/Isagog/DialogManager) 
and put it under the root of this project as `isagog-dm.yaml`

## Installation

Install the Isagog API client running:

```bash
./INSTALL.sh
```

This script creates a folder named `build`, containing the source code of the generated client, and install it in your local Maven repository.

## Import with Maven

```xml
<dependency>
    <groupId>com.isagog</groupId>
    <artifactId>api</artifactId>
    <version>1.0.0</version>
</dependency>
```
