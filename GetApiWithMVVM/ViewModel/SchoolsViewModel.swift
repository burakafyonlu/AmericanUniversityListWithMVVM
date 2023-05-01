//
//  SchoolsViewModel.swift
//  GetApiWithMVVM
//
//  Created by Burak Afyonlu on 1.05.2023.
//

import Foundation

struct SchoolListViewModel {

    let schoolList : [SchoolList]
    
}

extension SchoolListViewModel {
    
    func numberOfRowsInSection() -> Int {
        
        return self.schoolList.count
        
    }
    
    func schoolAtIndex(_ index: Int) -> SchoolViewModel {
        
        let school = self.schoolList[index]
        return SchoolViewModel(schoolList: school)
        
    }
    
}

struct SchoolViewModel {
    
    let schoolList : SchoolList
    
}
extension SchoolViewModel {
    
    var name : String {
        
        return self.schoolList.name
    }
    
    var country : String {
        
        return self.schoolList.country
    }
    
    var alpha_two_code : String {
        
        return self.schoolList.alpha_two_code
    }
}
