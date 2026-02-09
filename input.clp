; Getting user input

;- Goal: Strength or Hypertrophy
;- Frequency: 3,4,5,6
;- Primary muscle group: Chest, Back, Shoulder, Legs
;- Time: Under 1 hour, 1-2 hour
;- Exercise type preference: Free weight, Machine

; Template for the user-input facts
(deftemplate user-input
   (slot goal)
   (slot frequency)
   (slot muscle-group)
   (slot time)
   (slot exercise-type)
)

; Initial rule to set up the user-input fact
(defrule init-user
   (not (user-input))
   =>
   (assert (user-input
      (goal nil)
      (frequency nil)
      (muscle-group nil)
      (time nil)
      (exercise-type nil)))
)


(deffunction set-goal (?g)
   (do-for-all-facts
      ((?f user-input))
      TRUE
      (modify ?f (goal ?g))
   )
)
(deffunction set-frequency (?f)
   (do-for-all-facts
      ((?f user-input))
      TRUE
      (modify ?f (frequency ?f))
   )
)
(deffunction set-muscle-group (?m)
   (do-for-all-facts
      ((?f user-input))
      TRUE
      (modify ?f (muscle-group ?m))
   )
)
(deffunction set-time (?t)
   (do-for-all-facts
      ((?f user-input))
      TRUE
      (modify ?f (time ?t))
   )
)
(deffunction set-exercise-type (?e)
   (do-for-all-facts
      ((?f user-input))
      TRUE
      (modify ?f (exercise-type ?e))
   )
)

(deffunction input-goal ()
   (printout t "Please enter your goal number: " crlf)
   (printout t "1. Strength" crlf)
   (printout t "2. Hypertrophy" crlf)

   (bind ?input (read))

   (if (or (not (integerp ?input)) (not (member$ ?input (create$ 1 2))))
      then
      (printout t "Invalid input. Please enter 1 or 2." crlf)
      (input-goal)
   else
      (if (= ?input 1)
         then
         (set-goal "Strength")
      else
         (set-goal "Hypertrophy")
      )))

(deffunction input-frequency ()
   (printout t "Please enter your training frequency number: " crlf)
   (printout t "3 days per week" crlf)
   (printout t "4 days per week" crlf)
   (printout t "5 days per week" crlf)
   (printout t "6 days per week" crlf)

   (bind ?input (read))
   (if (or (not (integerp ?input)) (not (member$ ?input (create$ 3 4 5 6))))
      then
      (printout t "Invalid input. Please enter a number between 3 and 6." crlf)
      (input-frequency)
   else
      (set-frequency ?input)))

(deffunction input-muscle-group ()
   (printout t "Please enter your primary muscle group number: " crlf)
   (printout t "1. Chest" crlf)
   (printout t "2. Back" crlf)
   (printout t "3. Shoulders" crlf)
   (printout t "4. Legs" crlf)

   (bind ?input (read))

   (if (or (not (integerp ?input)) (not (member$ ?input (create$ 1 2 3 4))))
      then
      (printout t "Invalid input. Please enter a number between 1 and 4." crlf)
      (input-muscle-group)
   else
      (if (= ?input 1)
         then
         (set-muscle-group Chest)
      else
         (if (= ?input 2)
            then
            (set-muscle-group Back)
         else
            (if (= ?input 3)
               then
               (set-muscle-group Shoulders)
            else
               (set-muscle-group Legs))))))
   

(deffunction input-time ()
   (printout t "Please enter your preferred workout time number: " crlf)
   (printout t "1. Under 1 hour" crlf)
   (printout t "2. 1-2 hours" crlf)

   (bind ?input (read))

   (if (or (not (integerp ?input)) (not (member$ ?input (create$ 1 2))))
      then
      (printout t "Invalid input. Please enter 1 or 2." crlf)
      (input-time)
   else
      (if (= ?input 1)
         then
         (set-time "Under 1 hour")
      else
         (set-time "1-2 hours"))))

(deffunction input-exercise-type ()
   (printout t "Please enter your preferred exercise type number: " crlf)
   (printout t "1. Free weight" crlf)
   (printout t "2. Machine" crlf)

   (bind ?input (read))

   (if (or (not (integerp ?input)) (not (member$ ?input (create$ 1 2))))
      then
      (printout t "Invalid input. Please enter 1 or 2." crlf)
      (input-exercise-type)
   else
      (if (= ?input 1)
         then
         (set-exercise-type "Free weight")
      else
         (set-exercise-type "Machine"))))

; Call the inputs
