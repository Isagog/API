# Isagog API

All the definitions and generators of the Isagog APIs.

## Client Generation

### Requirements

#### Homebrew
```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"

```

#### OpenAPI Generator
```bash
brew install openapi-generator
```

#### Python 3.6

On Ubuntu 14.04 and 16.04:
```bash
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt-get update
sudo apt-get install python3.6
```

On Ubuntu 16.10 and 17.04:
```bash
sudo apt-get install python3.6
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
