package neuralnet

import neuralnet.NeuralNet.{ALayer, FCLayer, LayerType}
import chisel3._

class LayerFactory {

  def apply(neuralNetParams: NeuralNetParams, layerType: LayerType): Layer = {
     Module(layerType match {
      case FCLayer(params) => new FullyConnectedLayer(neuralNetParams, params)
      case ALayer(params) => new ActivationLayer(neuralNetParams, params)
    })
  }
}
