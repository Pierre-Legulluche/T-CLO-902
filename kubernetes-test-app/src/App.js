import React from 'react';

function App() {
  return (
    <div className="min-h-screen bg-gray-100">
      <header className="bg-blue-600 text-white py-6 text-center">
        <h1 className="text-4xl font-bold">Kubernetes is Cool!</h1>
      </header>
      <div className="flex justify-center my-8">
      <img src="/K8S-logo.png" alt="Kubernetes logo" className="w-64 h-auto"/>
      </div>
      <main className="container mx-auto px-4 py-8">
        <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
          <div className="bg-white rounded-lg shadow-md p-6">
            <h2 className="text-2xl font-semibold text-blue-600 mb-4">Scalabilité</h2>
            <p className="text-gray-700">Kubernetes permet une mise à l'échelle automatique de vos applications.</p>
          </div>
          <div className="bg-white rounded-lg shadow-md p-6">
            <h2 className="text-2xl font-semibold text-blue-600 mb-4">Haute disponibilité</h2>
            <p className="text-gray-700">Assurez une disponibilité maximale de vos services avec Kubernetes.</p>
          </div>
          <div className="bg-white rounded-lg shadow-md p-6">
            <h2 className="text-2xl font-semibold text-blue-600 mb-4">Déploiement facile</h2>
            <p className="text-gray-700">Déployez et mettez à jour vos applications sans temps d'arrêt.</p>
          </div>
        </div>
      </main>
    </div>
  );
}

export default App;