# mocks-server-boilerplate

This repository provides a boilerplate for easily setting up a project using [Mocks Server](https://www.mocks-server.org), a tool that allows you to create live, interactive mocks in place of real APIs.

## Features

- **Easy Configuration**: Define your mock routes in YAML, JSON, JavaScript, or TypeScript files. Mocks Server automatically loads and watches for changes in these files.

- **Dynamic Responses**: Configure multiple responses for the same route, enabling you to change the behavior of the mocked API while the server is running.

- **Integration with Development Tools**: Provides a JavaScript API, an interactive command-line interface, and a REST API to manage the mocked API responses in real-time.

## Prerequisites

- [Node.js](https://nodejs.org/) version 14 or higher.

- [Docker](https://www.docker.com/) installed on your system.

## Installation

1. Clone this repository:

   ```bash
   git clone https://github.com/PaneroEduardo/mocks-server-boilerplate.git
   ```

2. Navigate to the project directory:

   ```bash
   cd mocks-server-boilerplate
   ```

3. Install the dependencies:

   ```bash
   npm install
   ```

## Usage

You can manage the project using the provided `Makefile`, which includes several commands to streamline common tasks:

- **Display help information**:

   ```bash
   make help
   ```

- **Clean the project dependencies**:

   ```bash
   make clean
   ```

- **Install the project dependencies**:

   ```bash
   make install
   ```

- **Run the mocks server**:

   ```bash
   make run
   ```

   The server will start at `http://localhost:3100` by default.

- **Build a Docker image of the mocks server**:

   ```bash
   make build-image
   ```

- **Run the Docker image to serve the mocks server**:

   ```bash
   make run-image
   ```

   This will run the Docker container and expose the mocks server on the specified ports.

- **Stop the mocks server running in a Docker container**:

   ```bash
   make stop-image
   ```

- **Open the admin Swagger page in a browser**:

   ```bash
   make open-admin-swagger
   ```

   This will open the admin interface at `http://localhost:3110/docs`.

## Project Structure

- `mocks/`: Contains the route definitions and their responses. You can add or modify files in this directory to define new routes or change existing ones.

- `config/`: Configuration files for Mocks Server.

- `Dockerfile`: Defines the Docker image for the mocks server.

- `Makefile`: Contains commands to manage the project lifecycle.

## Customization

You can customize the server's behavior by editing the files in the `config/` directory. For more details on the available configuration options, refer to the [Mocks Server documentation](https://www.mocks-server.org/docs/configuration).

## Contributing

Contributions are welcome. If you encounter any issues or have suggestions for improvement, please open an [issue](https://github.com/PaneroEduardo/mocks-server-boilerplate/issues) or submit a pull request.

## License

This project is licensed under the [CC0-1.0 License](LICENSE). 