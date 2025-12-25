<project_standards>
  <metadata>
    <title>Python Project Coding Standards</title>
    <version>1.0</version>
    <language>Python 3.13</language>
  </metadata>

  <response_rules>
    <rule>Respond briefly and directly, using as few words as possible</rule>
    <rule>Respond with Markdown if not asked to create code</rule>
  </response_rules>

  <core_standards>
    <standard name="language">
      <requirement>Python 3.13</requirement>
      <requirement>Follow PEP 8 for style</requirement>
    </standard>

    <standard name="code_reuse">
      <principle>Don't Repeat Yourself (DRY) - Always reuse existing functions</principle>
      <requirement>Search codebase for similar functions before writing new code</requirement>
      <requirement>Import and use existing functions from other modules</requirement>
      <requirement>Only write new code when no suitable function exists</requirement>
      <anti_pattern>Duplicating logic that already exists in the project</anti_pattern>
    </standard>

    <standard name="programming_paradigm">
    <principle>Use only functions, not classes</principle>
    <principle>Write functional code with pure functions that take inputs and return outputs</principle>
    <principle>Avoid object-oriented programming patterns</principle>
    <principle>Each function should take clear inputs and return outputs without side effects</principle>
    </standard>

    <standard name="error_handling">
    <requirement>Do not use try/except/finally blocks - follow fail fast principle</requirement>
    <requirement>NEVER use response.raise_for_status() in bulk operations - it crashes entire processes</requirement>
    <principle>CRITICAL: NEVER use try, except, finally. Let errors fail fast and expose the actual failure point.</principle>
    <principle>CRITICAL: NEVER use response.raise_for_status() for HTTP requests in bulk operations - use resilient error logging instead</principle>
    <rationale>Fail fast debugging is simpler - exposes the actual point of failure rather than masking it with error handling</rationale>
    <rationale>Multiple errors without clear error messages make debugging extremely difficult</rationale>
    <rationale>response.raise_for_status() crashes entire 30+ minute processes when encountering 404s</rationale>
    <anti_pattern>
      <![CDATA[
    try:
      result = risky_operation()
    except ValueError:
      result = default_value
      ]]>
    </anti_pattern>
    <http_anti_pattern>
      <![CDATA[
    response = requests.get(url)
    if response.status_code != 200:
        response.raise_for_status()  # CRASHES entire process
      ]]>
    </http_anti_pattern>
    <preferred_pattern>
      <![CDATA[
    if is_valid_input(data):
      result = safe_operation(data)
    else:
      result = default_value
      ]]>
    </preferred_pattern>
    <http_preferred_pattern>
      <![CDATA[
    response = requests.get(url)
    if response.status_code != 200:
        error_msg = f"HTTP {response.status_code}: {endpoint} - {response.text[:200]}"
        logging.error(error_msg)
        if error_log_file:
            with open(error_log_file, 'a') as f:
                f.write(f"{datetime.now()}: {error_msg}\n")
        total_errors += 1
        continue  # Process continues
      ]]>
    </http_preferred_pattern>
    </standard>

    <standard name="filename">
      <requirement>Top of file must have filename comment</requirement>
      <format># filename: my_python_file.py</format>
    </standard>

    <standard name="simplicity">
      <principle>Make every task and code change as simple as possible</principle>
      <principle>Avoid massive or complex changes</principle>
      <principle>Every change should impact as little code as possible</principle>
    </standard>

    <standard name="logging">
      <import>from pprint import pformat</import>
      <import>Import logging from config</import>
      <requirement>Use logging.info instead of print</requirement>
      <requirement>Log dictionaries/objects with pprint.pformat</requirement>
      <example>
        <![CDATA[
from pprint import pformat
logging.info(f'\n' + pformat(data, indent=2, sort_dicts=False))
        ]]>
      </example>
    </standard>

    <standard name="cli">
      <requirement>Use typer for command-line interfaces</requirement>
      <requirement>Use rich for Console and Table output</requirement>
      <requirement>Never use blue color from rich - avoid blue styling</requirement>
    </standard>

    <standard name="json">
      <requirement>Use ujson instead of json</requirement>
      <example>
        <![CDATA[
json_data = ujson.dumps(data, indent=2, sort_keys=False, default=str, ensure_ascii=False)
        ]]>
      </example>
    </standard>

    <standard name="environment_variables">
      <requirement>Load API keys from .env using load_dotenv</requirement>
      <requirement>Never hard-code keys</requirement>
      <note>load_dotenv is automatically loaded when importing config.py</note>
    </standard>

    <standard name="code_structure">
      <requirement>Avoid small utility functions unless reused 3+ times</requirement>
      <requirement>Minimize code under if __name__ == '__main__'</requirement>
      <requirement>Use only app() or main() in main block</requirement>
    </standard>

    <standard name="fastapi_naming">
      <requirement>Always use "items" instead of "records" in FastAPI responses</requirement>
      <principle>Consistent naming convention for API collections</principle>
      <example>
        <![CDATA[
    # Preferred
    {"items": [...], "count": 100}

    # Avoid
    {"records": [...], "count": 100}
        ]]>
      </example>
    </standard>

    <standard name="fastapi_responses">
      <single_resource>
        <requirement>Single resource endpoints return the object directly</requirement>
        <requirement>No pagination metadata for single resources</requirement>
        <example>
          <![CDATA[
    @app.get("/users/{user_id}")
    def get_user(user_id: int):
        return {
            "id": 123,
            "name": "John Doe",
            "email": "john@example.com",
            "created_at": "2024-01-15T10:30:00Z"
        }
          ]]>
        </example>
      </single_resource>

      <paginated_collection>
        <requirement>All collection endpoints must include pagination parameters</requirement>
        <requirement>Use "items" for collections, never "records"</requirement>
        <parameter name="page" type="int" default="1">Current page number</parameter>
        <parameter name="items_per_page" type="int" default="200">Number of items per page</parameter>
        <response_format>
          <field name="items">Array of data objects</field>
          <field name="count">Number of items returned on current page</field>
          <field name="total_count">Total number of records matching the filter criteria</field>
          <field name="page">Current page number</field>
          <field name="items_per_page">Items per page (200)</field>
        </response_format>
        <example>
          <![CDATA[
    @app.get("/users")
    def get_users(page: int = 1, items_per_page: int = 200):
        return {
            "items": [...],
            "count": 150,
            "total_count": 3054,
            "page": page,
            "items_per_page": items_per_page
        }
          ]]>
        </example>
      </paginated_collection>
    </standard>

    <standard name="error_log_files">
      <requirement>Create timestamped error log files for bulk operations that may encounter HTTP errors</requirement>
      <requirement>Store error logs in logs/ directory with descriptive names</requirement>
      <format>logs/{operation}_{company}_{data_type}_{YYYYMMDD_HHMMSS}.log</format>
      <example>
        <![CDATA[
# Setup error log file
os.makedirs("logs", exist_ok=True)
error_log_timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
error_log_file = f"logs/sync_errors_{company_id}_{data_type}_{error_log_timestamp}.log"

# Log HTTP errors
if response.status_code != 200:
    error_msg = f"HTTP {response.status_code}: {endpoint} - {response.text[:200]}"
    with open(error_log_file, 'a') as f:
        f.write(f"{datetime.now()}: {context}: {error_msg}\n")

# Report at end
if os.path.exists(error_log_file):
    with open(error_log_file, 'r') as f:
        error_count = len(f.readlines())
    logging.info(f"HTTP errors logged: {error_count}")
    logging.info(f"Error log file: {error_log_file}")
        ]]>
      </example>
    </standard>

  </core_standards>

  <database_access>
    <engines>
      <postgresql>
        <version>PostgreSQL 16 with psycopg v3</version>
        <row_format>psycopg.rows.dict_row</row_format>
        <pattern>
        <![CDATA[
import db_postgres
conn = db_postgres.get_connection(autocommit=False)
cursor = conn.cursor()
cursor.execute("SELECT table_schema, table_name FROM information_schema.tables WHERE table_type = 'BASE TABLE'")
rows = cursor.fetchall()
conn.commit()
cursor.close()
conn.close()
        ]]>
        </pattern>
      </postgresql>

    <mariadb>
      <version>MariaDB 10.6 with pymysql</version>
      <row_format>pymysql.cursors.DictCursor</row_format>
      <pattern>
        <![CDATA[
import db_mysql
conn = db_mysql.get_connection(autocommit=False)
cursor = conn.cursor()
cursor.execute("SELECT table_schema, table_name FROM information_schema.tables WHERE table_type = 'BASE TABLE'")
rows = cursor.fetchall()
conn.commit()
cursor.close()
conn.close()
        ]]>
        </pattern>
      </mariadb>
    </engines>

    <note>Both engines return dictionary rows with column names as keys</note>
  </database_access>RetryClaude can make mistakes. Please double-check responses.

  <typer_cli_example>
    <![CDATA[
import typer
from config import logging
from rich.console import Console
from rich.table import Table
from utils_typer_cli import default_callback

app = typer.Typer(help="Manage partner subscriptions.", pretty_exceptions_enable=False)

@app.callback(invoke_without_command=True)
def callback(ctx: typer.Context):
    """Default callback for Typer app."""
    default_callback(ctx)


@app.command()
def list_skus():
    """List subscribed SKUs for a partner."""
    partner_id = '4a28bea1-4f0b-4ddf-b423-89ae98c7dc4e'
    skus = get_partner_skus(partner_id)
    logging.info(f'\n' + pformat(skus, indent=2, sort_dicts=False))

if __name__ == '__main__':
    app()
    ]]>
  </typer_cli_example>

  <debug_programs>
    <purpose>Claude generates temporary debug programs in debug_claude_generated/</purpose>
    <uses>
      <use>Database structure checks</use>
      <use>API endpoint verification</use>
      <use>Data format validation</use>
      <use>Quick functionality confirmation</use>
    </uses>
    <limitations>
      <limitation>No external API access from Claude Code development environment</limitation>
      <limitation>Cannot test live integrations or external services</limitation>
    </limitations>
    <note>These are temporary verification tools for development, not formal tests</note>
  </debug_programs>

  <json_export_settings>
    <filename_format>
      <default_behavior>filename_only</default_behavior>
      <timestamp>false</timestamp>
      <description>JSON exports use only the base filename without timestamp suffixes</description>
      <example>
        <input>data.json</input>
        <output>data.json</output>
        <not>data_20250919_035618.json</not>
      </example>
    </filename_format>
  </json_export_settings>

</project_standards>
