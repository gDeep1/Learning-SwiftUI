//
//  APIStore.swift
//  SwiftUIProject
//
//  Created by Gagandeep on 16/08/22.
//

import Foundation
import Combine

class APIStore {
    
    static let shared = APIStore()
    
    var subscriber: AnyCancellable?
    var cancellables = Set<AnyCancellable>()
    
    func howCombineWorks(){
        
        let fibonacciPublisher = [0,1,1,2,3,5].publisher
        subscriber = fibonacciPublisher.sink { value in
            print(value)
        }
        // OUTPUT:
        // 0 1 1 2 3 5
        
        subscriber = fibonacciPublisher.sink(receiveCompletion: { completion in
            switch completion {
            case .finished:
                print("finished")
            case .failure(let never):
                print(never)
            }
        }, receiveValue: { value in
            print(value)
        })
        // OUTPUT:
        // 0 1 1 2 3 5
        // finished
        
        /// To Cancel
        subscriber?.cancel()
        
        
        /** Subjects **/
        
        let passthroughObject = PassthroughSubject<String, Never>()
        passthroughObject.send("Hello")
        passthroughObject.send("World")
        passthroughObject.sink(receiveValue: { value in
            print(value)
        })
       // OUTPUT:
       // NO OUTPUT
        
        passthroughObject.send("Gagan")
        // OUTPUT:
        // Gagan
        
        
        let currentValueSubject = CurrentValueSubject<String, Never>("Initial Value")
        currentValueSubject.send("Hello")
        currentValueSubject.send("World")
        currentValueSubject.sink(receiveValue: { value in
            print(value)
        })
        //OUTPUT:
        //World
    }
    
    
// MARK: API Calls
    
    func fetchBooks() -> AnyPublisher<[Book], Never> {
        let url = URL(string: "books.json")!
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: [Book].self, decoder: JSONDecoder())
            .replaceError(with: [Book]())
            .eraseToAnyPublisher()
    }
    
    func fetchMovies() -> AnyPublisher<[Movie], Never> {
        let url = URL(string: "movies.json")!
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: [Movie].self, decoder: JSONDecoder())
            .replaceError(with: [Movie]())
            .eraseToAnyPublisher()
    }
    
    
    func fetchItems() {
        let combinedPublisher = Publishers.Zip(fetchBooks(), fetchMovies())
        
        combinedPublisher.sink { items in
            
            for item in items.0 {
                if let book = item as? Book {
                    print("\(book.title) – \(book.author)")
                } else if let movie = item as? Movie {
                    print("\(movie.title) – \(movie.year)")
                }
            }
        }
        .store(in: &cancellables)
    }
}




