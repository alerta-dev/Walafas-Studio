import React, { useState } from 'react'
import CanvasEditor from './components/CanvasEditor'
import AddLayerModal from './components/AddLayerModal'

function App() {
  const [layers, setLayers] = useState([])
  const [showModal, setShowModal] = useState(false)

  return (
    <div className="flex h-screen">
      <CanvasEditor layers={layers} setLayers={setLayers} />
      <div className="w-64 bg-white p-4 shadow-lg">
        <h2 className="text-lg font-bold mb-2">Capas</h2>
        {layers.map(layer => (
          <div key={layer.id} className="flex items-center justify-between mb-1">
            <span className="truncate">{layer.name}</span>
            <button onClick={() => setLayers(layers.filter(l => l.id !== layer.id))} className="text-red-500">×</button>
          </div>
        ))}
        <button onClick={() => setShowModal(true)} className="mt-4 w-full py-2 bg-blue-500 text-white rounded">+ Agregar</button>
        <button onClick={() => CanvasEditor.exportPNG()} className="mt-2 w-full py-2 bg-green-500 text-white rounded">Exportar PNG</button>
      </div>
      {showModal && <AddLayerModal onAdd={layer => { setLayers([...layers, layer]); setShowModal(false); }} onClose={() => setShowModal(false)} />}
    </div>
  )
}

export default App
