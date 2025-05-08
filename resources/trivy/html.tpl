<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Trivy Report - {{ .ArtifactName }}</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; background-color: #f9f9f9; color: #333; }
        h1 { font-size: 22px; color: #00539C; }
        table { width: 100%; border-collapse: collapse; margin-bottom: 20px; background: white; }
        th, td { border: 1px solid #ccc; padding: 8px; text-align: left; font-size: 14px; }
        th { background-color: #00539C; color: white; }
        tr:nth-child(even) { background-color: #f2f2f2; }
        .severity-CRITICAL { color: red; font-weight: bold; }
        .severity-HIGH { color: orange; }
        .severity-MEDIUM { color: goldenrod; }
        .severity-LOW { color: green; }
        .section-title { margin-top: 30px; font-size: 18px; color: #444; border-bottom: 2px solid #ccc; }
    </style>
</head>
<body>

<h1>{{ .ArtifactName }} - Trivy Report - {{ .GeneratedAt }}</h1>

{{ range .Results }}
    <div class="section-title">{{ .Target }}</div>
    {{ if .Vulnerabilities }}
        <table>
            <tr>
                <th>Package</th>
                <th>Vulnerability ID</th>
                <th>Severity</th>
                <th>Installed Version</th>
                <th>Fixed Version</th>
                <th>Links</th>
            </tr>
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
        </table>
    {{ else }}
        <p>No vulnerabilities found.</p>
    {{ end }}
{{ end }}

</body>
</html>
