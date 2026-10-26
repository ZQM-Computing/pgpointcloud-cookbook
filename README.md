# pgPointCloud Cookbook

<!-- ZQM-START -->
<!-- markdownlint-disable MD033 -->
<p align="center">
  <strong>ZQM Computing — Geospatial Engineering & Scientific Computing</strong><br>
  <a href="https://github.com/ZQM-Computing">ZQM Computing</a>
</p>
<!-- markdownlint-enable MD033 -->
<!-- ZQM-END -->

![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)

A **pgPointCloud cookbook** for point-cloud patches in Postgres, PDAL ingest. Patterns are drawn from the ZQM fleet's pgpointcloud 1.2.5 installs (shipped with the PostGIS bundle). Honest caveat: the SQL constructor PC_MakePoint is broken in this build — the patterns use PDAL ingest, not SQL-constructed points. It is intended for Engineers who store LiDAR in Postgres and query it as patches. Validate each pattern against your own data, software versions, and operating environment before adopting it.

## Repository role and status

**Status:** Active, public — first executable verification pattern written. CI validates SQL/documentation contracts and the safe `verify.sh` runner; live extension availability must still be verified against the target database.

**What this repository is:** pgPointCloud patterns — see the table below.

**What it contributes:** Part of the ZQM Computing geospatial portfolio. The umbrella index for the series is [geospatial-cookbooks](https://github.com/ZQM-Computing/geospatial-cookbooks).

**Standing:** This repository is maintained independently. Automated checks cover only the paths and environments configured in its workflows; they do not establish production readiness or operational certification.

## Who this is for

Engineers who store LiDAR in Postgres and query it as patches.

## Prerequisites

- pgpointcloud 1.2.5 (PostGIS bundle)
- PDAL for ingest (see pdal-cookbook)
- Postgres with PostGIS

## Patterns

| # | Example | Status | What it demonstrates |
|---|---------|--------|---------------------|
| 01 | [01-extension-setup](examples/01-extension-setup/README.md) | Written; live DB check required | Verify PostGIS and pgPointCloud are installed and report their exact versions |
| 02 | `02-pdal-ingest` | Ingesting LAS files into patch tables with PDAL |
| 03 | `03-patch-queries` | Patch statistics, filtering, and intersection queries |
| 04 | `04-full-workflow` | End-to-end: file → patches → query |

## Repository layout

```text
pgpointcloud-cookbook/
├── examples/01-extension-setup/  # SQL verification + safe psql runner
├── tests/             # static SQL/documentation contracts
├── .github/workflows/ # CI
├── README.md
└── LICENSE
```

## Roadmap

- Add a PDAL-driven ingest pattern with a small, redistributable test fixture.
- Add patch-query examples validated against an installed pgPointCloud database.
- Keep SQL point construction out of the examples until the known PC_MakePoint defect is independently resolved.

## Contributing

A contributing guide lands with the first pattern pass. Report security issues to <zqmcomputing@gmail.com> — please do not open a public issue for those.

## More from this series

- [pdal-cookbook](https://github.com/ZQM-Computing/pdal-cookbook) — Point-cloud pipelines, translation, and pgPointCloud ingest
- [postgis-cookbook](https://github.com/ZQM-Computing/postgis-cookbook) — Spatial indexing, joins & KNN, SRID management, vector tiles
- [cloudcompare-cookbook](https://github.com/ZQM-Computing/cloudcompare-cookbook) — Point-cloud visualization, registration, and comparison
