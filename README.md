# Isagog API

All the definitions and generators of the Isagog APIs.

## Client Generation

### Requirements

* Install `Homebrew`:
```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"

```

* Install `OpenAPI Generator`:
```bash
brew install openapi-generator
```

### Clients generation

Generate the API clients for each microservice running the scripts in the `client` folder named `generate_*`.


### Installation

Install the complete Isagog API client (including all the microservices) running:

```bash
cd client
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
