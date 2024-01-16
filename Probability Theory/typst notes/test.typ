#import "@preview/cetz:0.1.2": canvas, plot

#set page(width: auto, height: auto, margin: .5cm)

#let normal = x => (-calc.pow(calc.e, x * x  / 2)) / calc.sqrt(2 * calc.pi)

#canvas(length: 1cm, {
  plot.plot(
    size: (30,30), 
    // x-tick-step: 180,          
    // y-tick-step: 1,
    // x-unit: $degree$, 
    { 
      plot.add(domain: (-1, 1), normal);
      
    }
  )
})

#{
  1/2 * 2
}
