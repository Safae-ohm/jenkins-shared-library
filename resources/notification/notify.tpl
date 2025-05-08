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

    h4 {
      background-color: ${HEADER_COLOR};
      color: #fff;
      padding: 10px 20px;
      margin: 0;
      font-size: 14px;
      font-weight: normal;
    }

    table {
      width: 85%;
      margin: 20px auto;
      border-collapse: collapse;
      background-color: #fff;
      font-size: 13px;
      border: 1px solid #ccc;
    }

    th, td {
      padding: 8px 12px;
      text-align: left;
      border: 1px solid #ccc;
    }

    th {
      background-color: #6c757d;
      color: #fff;
      font-weight: 500;
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

<h4>Résumé de Déploiement</h4>

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
