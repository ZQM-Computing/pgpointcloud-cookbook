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

**Status:** Active, public — seeding. Pattern passes land in follow-up work from fleet-verified setups; the tables below list what is planned, not what is already written.

**What this repository is:** pgPointCloud patterns — see the table below.

**What it contributes:** Part of the ZQM Computing geospatial portfolio. The umbrella index for the series is [geospatial-cookbooks](https://github.com/ZQM-Computing/geospatial-cookbooks).

**Standing:** This repository is maintained independently. Automated checks cover only the paths and environments configured in its workflows; they do not establish production readiness or operational certification.

## Who this is for

Engineers who store LiDAR in Postgres and query it as patches.

## Prerequisites

- pgpointcloud 1.2.5 (PostGIS bundle)
- PDAL for ingest (see pdal-cookbook)
- Postgres with PostGIS

## Patterns (planned)

| # | Example | What it will demonstrate |
|---|---------|--------------------------|
| 01 | `01-extension-setup` | Enabling the extension and verifying it loads |
| 02 | `02-pdal-ingest` | Ingesting LAS files into patch tables with PDAL |
| 03 | `03-patch-queries` | Patch statistics, filtering, and intersection queries |
| 04 | `04-full-workflow` | End-to-end: file → patches → query |

## Repository layout

```text
pgpointcloud-cookbook/
├── examples/          # pattern passes, landing in follow-up work
├── README.md
└── LICENSE
```

## Roadmap

- First pattern pass: the first two table rows
- Second pass: the remaining rows, from fleet-verified setups

## Contributing

A contributing guide lands with the first pattern pass. Report security issues to <zqmcomputing@gmail.com> — please do not open a public issue for those.

## More from this series

- [pdal-cookbook](https://github.com/ZQM-Computing/pdal-cookbook) — Point-cloud pipelines, translation, and pgPointCloud ingest
- [postgis-cookbook](https://github.com/ZQM-Computing/postgis-cookbook) — Spatial indexing, joins & KNN, SRID management, vector tiles
- [cloudcompare-cookbook](https://github.com/ZQM-Computing/cloudcompare-cookbook) — Point-cloud visualization, registration, and comparison
