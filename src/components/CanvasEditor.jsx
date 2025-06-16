import React, { useRef, useEffect } from 'react'
import { Stage, Layer } from 'react-konva'
import SpriteLayer from './LayerItem'

function CanvasEditor({ layers, setLayers }) {
  const stageRef = useRef()

  // Exponer exportación
  useEffect(() => {
    CanvasEditor.exportPNG = () => {
      const uri = stageRef.current.toDataURL({ pixelRatio: 2 })
      const link = document.createElement('a')
      link.download = 'personaje.png'
      link.href = uri
      link.click()
    }
  }, [])

  return (
    <div className="flex-1 flex items-center justify-center bg-gray-200">
      <Stage width={800} height={600} ref={stageRef} className="bg-white">
        <Layer>
          {layers.map(layer => (
            <SpriteLayer key={layer.id} {...layer} onChange={newAttrs => {
              setLayers(layers.map(l => l.id === layer.id ? {...l, ...newAttrs} : l))
            }} />
          ))}
        </Layer>
      </Stage>
    </div>
  )
}

export default CanvasEditor
