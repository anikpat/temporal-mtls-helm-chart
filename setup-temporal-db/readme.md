# Setup PostgreSQL
- To setup the PostgreSQL database as the Temporal default and visibility stores, Temporal offers a tool called `temporal-sql-tool`. This tool needs to be built for the target environment, which can be simply done by running `make temporal-sql-tool` in the root directory of the [Temporal repository](https://github.com/temporalio/temporal).

- To setup the database, fill in the environment variables in `setup-database.sh` and run the script. The script will create the required databases and update the schemas.

- The schemas live in `./schema` directory, and moved here from the [Temporal repository](https://github.com/temporalio/temporal) for convenience. To update the schemas simply replace them with the latest files and run the script again. 
