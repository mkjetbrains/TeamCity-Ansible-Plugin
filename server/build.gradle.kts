import com.github.rodm.teamcity.TeamCityEnvironment

plugins {
    kotlin("jvm")
    id("com.github.rodm.teamcity-server")
}

dependencies {
    implementation(kotlin("stdlib"))
    implementation(project(":common"))

    ///for BuildProblemManager
    compileOnly("org.jetbrains.teamcity.internal:server:${rootProject.ext["teamcityVersion"]}")

    agent(project(path = ":agent", configuration = "plugin"))
}

teamcity {
    // Use TeamCity 8.1 API
    version = rootProject.ext["teamcityVersion"] as String

    server {
        descriptor {
            name = "ansibleSupport"
            displayName = "Ansible Support"
            version = rootProject.version as String?
            vendorName = "JetBrains"
            vendorUrl = "https://jetbrains.com"
            description = "Provides runner for Ansible playbook execution"
            useSeparateClassloader = true
        }
        archiveName = "ansible-plugin"
    }

    environments {
        operator fun String.invoke(block: TeamCityEnvironment.() -> Unit) {
            environments.create(this, closureOf(block))
        }

        "teamcity" {
            version = rootProject.ext["teamcityVersion"] as String
        }
    }
}

tasks.withType<Jar> {
    archiveBaseName.set("ansible-plugin")
}

task("teamcity") {
    dependsOn("serverPlugin")

    doLast {
        println("##teamcity[publishArtifacts '${(tasks["serverPlugin"] as Zip).archiveFile}']")
    }
}