<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <title>Résumé de Déploiement</title>
  <style>
    body {
      font-family: 'Segoe UI', Tahoma, sans-serif;
      background-color: #f9f9f9;
      color: #333;
      margin: 0;
      padding: 0;
    }

    h2 {
      background-color: ${HEADER_COLOR};
      color: #fff;
      padding: 12px 24px;
      margin: 0;
      font-size: 18px;
      font-weight: normal;
    }

    table {
      width: 85%;
      margin: 24px auto;
      border-collapse: collapse;
      background-color: #fff;
      box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
      font-size: 14px;
    }

    th, td {
      padding: 10px 16px;
      text-align: left;
      border-bottom: 1px solid #e2e2e2;
    }

    th {
      background-color: #495057;
      color: #fff;
      font-weight: 500;
    }

    tr:last-child td {
      border-bottom: none;
    }

    a {
      color: #007bff;
      text-decoration: none;
    }

    a:hover {
      text-decoration: underline;
    }

    .status {
      font-weight: bold;
      color: ${STATUS_COLOR};
    }
  </style>
</head>
<body>

<h2>Résumé de Déploiement</h2>

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
      <td>${BUILD_NUMBER}</td>
    </tr>
    <tr>
      <td>Nom du Projet</td>
      <td>${JOB_NAME}</td>
    </tr>
    <tr>
      <td>Statut</td>
      <td class="status">${BUILD_STATUS}</td>
    </tr>
    <tr>
      <td>URL du Build</td>
      <td><a href="${BUILD_URL}" target="_blank">${BUILD_URL}</a></td>
    </tr>
    <tr>
      <td>URL du Projet</td>
      <td><a href="${JOB_DISPLAY_URL}" target="_blank">${JOB_DISPLAY_URL}</a></td>
    </tr>
    <tr>
      <td>Détails de l’Exécution</td>
      <td><a href="${RUN_DISPLAY_URL}" target="_blank">${RUN_DISPLAY_URL}</a></td>
    </tr>
  </tbody>
</table>

</body>
</html>
