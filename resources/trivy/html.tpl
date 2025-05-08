<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Trivy Report for {{ .ArtifactName }}</title>
    <style>
        body { font-family: Arial, sans-serif; padding: 20px; background-color: #f4f4f4; }
        h1 { color: #333; }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; background-color: #fff; }
        th, td { border: 1px solid #ccc; padding: 8px; }
        th { background-color: #00539C; color: white; }
        tr:nth-child(even) { background-color: #f9f9f9; }
        .severity-CRITICAL { color: red; font-weight: bold; }
        .severity-HIGH { color: orange; }
        .severity-MEDIUM { color: goldenrod; }
        .severity-LOW { color: green; }
    </style>
</head>
<body>

<h1>Trivy Report for {{ .ArtifactName }}</h1>
<p>Generated at: {{ .GeneratedAt }}</p>

{{ range .Results }}
    <h2>{{ .Target }}</h2>

    {{ if .Vulnerabilities }}
    <table>
        <thead>
            <tr>
                <th>Package</th>
                <th>Vulnerability ID</th>
                <th>Severity</th>
                <th>Installed Version</th>
                <th>Fixed Version</th>
                <th>References</th>
            </tr>
        </thead>
        <tbody>
            {{ range .Vulnerabilities }}
            <tr>
                <td>{{ .PkgName }}</td>
                <td>{{ .VulnerabilityID }}</td>
                <td class="severity-{{ .Severity }}">{{ .Severity }}</td>
                <td>{{ .InstalledVersion }}</td>
                <td>{{ .FixedVersion }}</td>
                <td>
                    {{ range .References }}
                        <a href="{{ . }}" target="_blank">{{ . }}</a><br/>
                    {{ end }}
                </td>
            </tr>
            {{ end }}
        </tbody>
    </table>
    {{ else }}
        <p>No vulnerabilities found.</p>
    {{ end }}

{{ end }}

</body>
</html>
