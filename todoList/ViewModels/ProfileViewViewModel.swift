import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift
import FirebaseAuth

class ProfileViewViewModel: ObservableObject {
    @Published var user: User?
    @Published var isLoading: Bool = true

    
    init() {}
    
    
    func fetchUser(userId: String) {
        self.isLoading = true
        
        let db = Firestore.firestore()
        let collectionRef = db.collection("users")
        let query = collectionRef.whereField("id", isEqualTo: userId)
        
        query.getDocuments { [weak self] (querySnapshot, error) in
            if let error = error {
                print("Error fetching user: \(error)")
                return
            }
            
            guard let documents = querySnapshot?.documents else {
                print("No documents found.")
                return
            }
            
            // Assuming the first document contains the user data
            if let document = documents.first {
                do {
                    // Parse the document data into a User object
                    let user = try document.data(as: User.self)
                    
                    print(user)
                    self?.user = user
                } catch {
                    print("Error decoding user document: \(error)")
                    self?.isLoading = false
                }
            } else {
                print("No user document found.")
            }
            
            self?.isLoading = false
        }
    }
    
    func logout() {
        do {
            try Auth.auth().signOut()
        } catch {
            print (error)
        }
    }
}
