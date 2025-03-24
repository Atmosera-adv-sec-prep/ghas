# Using CodeQL Locally

## Prerequisites

- Ensure you have the necessary tools and dependencies installed for the language you are analyzing (e.g., Java, Python, etc.).

## Steps to Use CodeQL Locally

### 1. Install CodeQL CLI

- Download the CodeQL CLI from the [GitHub releases page](https://github.com/github/codeql-cli-binaries/releases).
- Extract the downloaded archive to a directory of your choice.
- Add the `codeql` binary to your system's PATH.

### 2. Set Up a CodeQL Database

- Create a CodeQL database for your project. Navigate to your project directory and run:
  ```sh
  codeql database create my-database --language=<language>
  ```
  Replace `<language>` with the appropriate language identifier (e.g., `java`, `cpp`, `python`, etc.).

### 3. Run Queries

- You can run CodeQL queries against the database you created. For example:
  ```sh
  codeql query run my-query.ql --database=my-database
  ```
- You can find standard queries in the [CodeQL GitHub repository](https://github.com/github/codeql).

### 4. Analyze Results

- The results of the queries will be output in a specified format (e.g., SARIF, CSV). You can analyze these results to identify potential issues in your code.

## Example

Here is an example of how to create a database and run a query for a Java project:

```sh
# Navigate to your project directory
cd path/to/your/project

# Create a CodeQL database
codeql database create my-database --language=java

# Run a query
codeql query run path/to/your/query.ql --database=my-database
```

## Additional Resources

- [CodeQL Documentation](https://codeql.github.com/docs/)
- [CodeQL GitHub Repository](https://github.com/github/codeql)