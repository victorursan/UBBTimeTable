//
//  Subject.swift
//  UBBTimeTable
//
//  Created by Victor Ursan on 9/11/14.
//  Copyright (c) 2014 Victor Ursan. All rights reserved.
//

import UIKit

class Subject: NSObject {
  
  var cadruDidactic: String
  var disciplina: String
  var formatia: String
  var frecventa: String
  var grupa: String
  var orele: String
  var sala: String
  var tipul: String
  var ziua: String
  
  init(grupa: String, ziua: String, orele: String, frecventa: String, sala: String, formatia: String, tipul: String, disciplina: String, cadruDidactic: String) {
    self.grupa = grupa
    self.ziua = ziua
    self.orele = orele
    self.frecventa = frecventa
    self.sala = sala
    self.formatia = formatia
    self.tipul = tipul
    self.disciplina = disciplina
    self.cadruDidactic = cadruDidactic
    super.init()
  }
  
  func isEqualTo(object: Subject) -> Bool {
    return (self.ziua == object.ziua && self.orele == object.orele && self.frecventa == object.frecventa && self.sala == object.sala && self.formatia == object.formatia && self.tipul == object.tipul && self.disciplina == object.disciplina && self.cadruDidactic == object.cadruDidactic)
  }
  
}
