import XCTest
@testable import TWTextEditor

final class TWTextEditorTests: XCTestCase {
    
    var sut: TWTextEditor!
    
    override  func setUp() {
        sut = TWTextEditor()
    }
  
    
    func testLengthOfTweetWithRandomCharacters_ShouldReturnTrue() {
        //Arrange
        let tweet = "Hello  "
        //Act
        let lengthOfTweet = sut.lengthOf(tweet: tweet)
        //Assert
        
        XCTAssertEqual(lengthOfTweet, 7, "ERROR:- Length of the given tweet  supposed to equal 7")
        
       }
    
    func testLengthOfTweetWithEmoji_ShouldReturnFalse() {
        //Arrange
        let tweet = "😀😀"
        //Act
        let lengthOfTweet = sut.lengthOf(tweet: tweet)
        //Assert
        XCTAssertFalse(lengthOfTweet == tweet.count, "ERROR:- Length of the given tweet with emoji supposed not to equal tweet count")
        
       }
    
    func testCleanAndCountFoundURL_ShoullReturnTrue() {
        //Arrange
        let tweet = "google.com"
        //Act
        let (_, urlLength) = sut.cleanAndCountURLs(text: tweet)
        //Assert
        
        XCTAssertEqual(urlLength, sut.weightOfURL , "ERROR:- Length of the given tweet with emoji supposed not to equal tweet count")
        
    }
    
    func testGivenTweetWithDifferentTypeOfInput_ShouldReturnTrue() {
        //Arrange
        
        let tweet = "google.com😀😀"
        //Act
        
        let lengthOfTweet = sut.lengthOf(tweet: tweet)

        //Assert
        
        XCTAssertEqual(lengthOfTweet, 27 , "ERROR:- Length of the given tweet with emoji and url supposed to equal 27")
    }
}
