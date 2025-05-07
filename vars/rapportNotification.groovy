def call(Map params = [:]) {
    
    def attachments = params.get('attachmentsPattern', '')
    def buildNumber = env.BUILD_NUMBER
    def jobName = env.JOB_NAME
    def buildUrl = env.BUILD_URL

    // Charger le template
    def rawTpl = libraryResource('notification/rapportnotify.tpl')

    // Préparer les données à injecter dans le template
    def engine = new groovy.text.SimpleTemplateEngine()
    def binding = [
        BUILD_NUMBER: buildNumber,
        JOB_NAME    : jobName,
        BUILD_URL   : buildUrl,
        REPORTS     : attachments ? attachments.split(',').collect { it.trim() } : []
    ]

    def body = engine.createTemplate(rawTpl).make(binding).toString()

    emailext(
        subject: "Rapport de build : ${jobName} #${buildNumber}",
        body: body,
        mimeType: 'text/html',
        to: recipient,
        attachLog: true,
        compressLog: true,
        attachmentsPattern: attachments
    )
}
