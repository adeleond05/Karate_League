package competenciafutbol;

import com.intuit.karate.junit5.Karate;

public class ParallelTest {

    @Karate.Test
    Karate testParallel(){
       return Karate.run().relativeTo(getClass());
    }

}
