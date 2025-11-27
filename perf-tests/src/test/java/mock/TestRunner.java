package mock;

import com.intuit.karate.junit5.Karate;

class TestRunner {
    
    @Karate.Test
    Karate testAll() {
        // Lance tous les fichiers .feature présents dans le package "mock"
        return Karate.run().relativeTo(getClass());
    }
}
