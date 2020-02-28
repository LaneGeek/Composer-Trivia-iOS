import Foundation

class Composer {
    
    // Properties
    var name = ""
    var birthYear = 0
    var deathYear = 0
    
    // Constructor
    init (name: String, birthYear: Int, deathYear: Int) {
        self.name = name
        self.birthYear = birthYear
        self.deathYear = deathYear
    }
    
    // Static method that returns a composer chosen at random
    static func getRandomComposer() -> Composer {
        
        // This data has been copied from the Android version
        var composersNames = ["Beethoven", "Mozart", "Tchaikovsky", "Mahler", "Bach", "Vivaldi",
                              "Handel", "Haydn", "Rossini", "Schubert", "Berlioz", "Liszt", "Wagner", "Verdi",
                              "Bruckner", "Brahms", "Dvorak", "Puccini", "Debussy", "Ravel", "Sibelius",
                              "Schoenberg", "Messiaen", "Prokofiev", "Rachmaninoff", "Stravinsky",
                              "Rimsky-Korsakov", "Mendelssohn"]
        
        var birthYears = [1770, 1756, 1840, 1860, 1685, 1678, 1685, 1732, 1792, 1797,
                          1803, 1811, 1813, 1813, 1824, 1833, 1841, 1858, 1862, 1875,
                          1865, 1874, 1908, 1891, 1873, 1882, 1844, 1809]
        
        var deathYears = [1827, 1791, 1893, 1911, 1750, 1741, 1759, 1809, 1868, 1828,
                          1869, 1886, 1883, 1901, 1896, 1897, 1904, 1924, 1918, 1937,
                          1957, 1951, 1992, 1953, 1943, 1971, 1908, 1847]
        
        // A new empty array of composers
        var composers: [Composer] = []
        
        // Populate the empty array with data above
        composersNames.forEach { _ in
            composers.append(Composer(name: composersNames.popLast()!, birthYear: birthYears.popLast()!, deathYear: deathYears.popLast()!))
        }
        
        // Pick and return a randomly chosen composer
        return composers[Int.random(in: 0 ..< composers.count)]
    }
}
