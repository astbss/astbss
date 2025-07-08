<project_standards>
  <metadata>
    <title>Python Project Coding Standards</title>
    <version>1.0</version>
    <language>Python 3.13</language>
  </metadata>

  <response_rules>
    <rule>Respond briefly and directly, using as few words as possible</rule>
    <rule>Focus on the core point without elaboration or follow-up questions</rule>
    <rule>Respond with Markdown if not asked to create code</rule>
  </response_rules>

  <core_standards>
    <standard name="language">
      <requirement>Python 3.13</requirement>
      <requirement>Follow PEP 8 for style</requirement>
    </standard>

    <standard name="error_handling">
      <requirement>Avoid try/except in new code for simpler debugging</requirement>
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
  </core_standards>

  <typer_cli_example>
    <![CDATA[
import typer
from config import logging

app = typer.Typer(help="Manage partner subscriptions.", pretty_exceptions_enable=False)

@app.command()
def list_skus():
    """List subscribed SKUs for a partner."""
    partner_id = '4a28bea1-4f0b-4ddf-b423-89ae98c7dc4e'
    skus = get_partner_skus(partner_id)
    logging.info(f'\n' + pformat(skus, indent=2, sort_dicts=False))

@app.callback(invoke_without_command=True)
def callback(ctx: typer.Context):
    """Default callback for Typer app."""
    if ctx.invoked_subcommand is None:
        typer.echo("No command provided. Available commands:")
        if hasattr(ctx, 'command') and hasattr(ctx.command, 'commands'):
            commands = ctx.command.commands
            for name, cmd in commands.items():
                if name:
                    help_text = cmd.help or cmd.short_help or "No description available"
                    typer.echo(f"  {name:<15} {help_text}")
            script_name = os.path.basename(sys.argv[0])
            typer.echo(f"\nRun 'python {script_name} --help' for more details")

if __name__ == '__main__':
    app()
    ]]>
  </typer_cli_example>
</project_standards>
