import unittest
from pathlib import Path

ROOT = Path(__file__).parents[1]
EXAMPLE = ROOT / "examples" / "01-extension-setup"


class ExtensionSetupContractTests(unittest.TestCase):
    def test_example_documents_prerequisites_and_validation_boundary(self):
        readme = (EXAMPLE / "README.md").read_text(encoding="utf-8")
        self.assertIn("PDAL", readme)
        self.assertIn("does not prove the extensions exist", readme)
        self.assertIn("verify-extensions.sql", readme)

    def test_sql_checks_both_required_extensions_and_reports_versions(self):
        sql = (EXAMPLE / "verify-extensions.sql").read_text(encoding="utf-8").lower()
        self.assertIn("('postgis'), ('pointcloud')", sql)
        self.assertIn("pg_extension", sql)
        self.assertIn("extversion", sql)
        self.assertNotIn("pc_makepoint", sql)


if __name__ == "__main__":
    unittest.main()
