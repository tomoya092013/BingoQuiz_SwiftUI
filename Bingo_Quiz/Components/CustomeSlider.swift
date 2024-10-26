import SwiftUI

struct CustomSlider: View {
  @Binding var value: Double
  let range: ClosedRange<Double>
  let step: Double
  var minimumTrackTintColor: Color
  var maximumTrackTintColor: Color
  
  init(value: Binding<Double>, range: ClosedRange<Double>, minimumTrackTintColor: Color = .mint, maximumTrackTintColor: Color = .mint, step: Double) {
    self._value = value
    self.range = range
    self.step = step
    self.minimumTrackTintColor = minimumTrackTintColor
    self.maximumTrackTintColor = maximumTrackTintColor
    
    UISlider.appearance().minimumTrackTintColor = UIColor(minimumTrackTintColor)
    UISlider.appearance().maximumTrackTintColor = UIColor(maximumTrackTintColor)
  }
  
  var body: some View {
    Slider(value: $value, in: range,step: step)
  }
}
