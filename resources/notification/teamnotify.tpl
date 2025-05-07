<p><strong>Le build <u>${BUILD_NUMBER}</u> du job <u>${JOB_NAME}</u> est terminé.</strong></p>
<p><strong>Lien du build :</strong> <a href="${BUILD_URL}">${BUILD_URL}</a></p>

<p><strong>Rapports joints :</strong></p>
<ul>
<% REPORTS.each { report -> %>
    <li>${report} (en pièce jointe)</li>
<% } %>
</ul>

<p>Merci de consulter les pièces jointes pour plus de détails.</p>
