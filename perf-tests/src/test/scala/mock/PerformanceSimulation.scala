package mock

import com.intuit.karate.gatling.PreDef._
import io.gatling.core.Predef._
import scala.concurrent.duration._

class PerformanceSimulation extends Simulation {

  // 1. Définition du protocole Karate
  // On dit à Gatling d'ignorer les ID spécifiques dans les rapports (pour éviter d'avoir 1000 lignes différentes)
  val protocol = karateProtocol(
    "/users/{id}" -> Nil
  )

  // 2. Définition du scénario
  // On pointe vers le fichier .feature qu'on vient de créer
  val getUsersScn = scenario("Get Users Load Test")
    .exec(karateFeature("classpath:mock/users.feature"))

  // 3. Configuration de l'injection (La stratégie de charge)
  setUp(
    getUsersScn.inject(
        // Exemple : Monter progressivement à 10 utilisateurs en 5 secondes
        rampUsers(10).during(5.seconds),
        
        // Puis maintenir 5 utilisateurs par seconde pendant 10 secondes
        constantUsersPerSec(5).during(10.seconds)
    ).protocols(protocol)
  )
}