<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <title>Résumé de Déploiement</title>
  <style>
    body {
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background-color: #f8f9fa;
      margin: 0;
      padding: 0;
      color: #212529;
    }

    h1 {
      background-color: ${HEADER_COLOR}; /* Couleur dynamique selon le statut */
      color: #ffffff;
      padding: 24px 32px;
      margin: 0;
      font-size: 26px;
      border-bottom: 4px solid rgba(0,0,0,0.1);
    }

    table {
      width: 90%;
      margin: 40px auto;
      border-collapse: collapse;
      background-color: #ffffff;
      box-shadow: 0 0 12px rgba(0,0,0,0.1);
      border-radius: 8px;
      overflow: hidden;
    }

    th, td {
      padding: 16px 20px;
      text-align: left;
      border-bottom: 1px solid #dee2e6;
    }

    th {
      background-color: #343a40;
      color: #ffffff;
      text-transform: uppercase;
      font-size: 13px;
      letter-spacing: 0.05em;
    }

    tr:last-child td {
      border-bottom: none;
    }

    a {
      color: #007bff;
      text-decoration: none;
      font-weight: 500;
    }

    a:hover {
      text-decoration: underline;
    }

    .status {
      font-weight: bold;
      color: ${STATUS_COLOR}; /* Couleur dynamique du statut */
    }
  </style>
</head>
<body>

<h1>Résumé de Déploiement</h1>

<table>
  <thead>
    <tr>
      <th>Nom</th>
      <th>Valeur</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Numéro de Build</td>
      <td id="build_number">${BUILD_NUMBER}</td>
    </tr>
    <tr>
      <td>Nom du Projet</td>
      <td id="job_name">${JOB_NAME}</td>
    </tr>
    <tr>
      <td>Statut du Build</td>
      <td id="build_status" class="status">${BUILD_STATUS}</td>
    </tr>
    <tr>
      <td>URL du Build</td>
      <td id="build_url"><a href="${BUILD_URL}" target="_blank">${BUILD_URL}</a></td>
    </tr>
    <tr>
      <td>URL du Projet</td>
      <td id="branch_url"><a href="${JOB_DISPLAY_URL}" target="_blank">${JOB_DISPLAY_URL}</a></td>
    </tr>
    <tr>
      <td>Détails de l'Exécution</td>
      <td id="build_details"><a href="${RUN_DISPLAY_URL}" target="_blank">${RUN_DISPLAY_URL}</a></td>
    </tr>
  </tbody>
</table>

</body>
</html>
