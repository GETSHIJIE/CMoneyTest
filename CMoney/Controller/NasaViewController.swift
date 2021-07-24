//
//  NasaViewController.swift
//  CMoney
//
//  Created by 黃仕杰 on 2021/7/24.
//

import UIKit

class NasaViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: ViewModel
    private var nasaViewModel = NasaViewModel(nasaAPI: NasaAPI())
    private var collectionViewModel = UICollectionViewModel()
    private var collectionDataSource: UICollectionDataSource<NasaCollectionViewCell, Nasa>!


    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.collectionViewLayout = UICollectionViewLayout()
        receiveCollectionViewModel()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        receiveNasaViewModel()
    }
    
    private func receiveCollectionViewModel() {
        collectionViewModel.cellSelectBlock = { [self] (collectionView, indexPath) in
            let index = indexPath.row
            collectionDataSource.setSelectIndex(index: index)
            performSegue(withIdentifier: DetailViewController.SegueIdentifier, sender: nil)
        }
        collectionView.delegate = collectionViewModel
        
    }
    
    private func receiveNasaViewModel() {
        nasaViewModel.bindToControllerBlock = { [self] in
            let viewModelResult = nasaViewModel.result
            let error = viewModelResult.error
            if error != .ApiSuccess {
                return
            }
            self.collectionDataSource =
                UICollectionDataSource(cellIdentifier: NasaCollectionViewCell.identifier,
                                       items: viewModelResult.model!.data,
                                       configureCell: { cell, nasa in
                                        cell.config(nasa: nasa)
                                       })
            DispatchQueue.main.async {
                collectionView.dataSource = collectionDataSource
                collectionView.reloadData()
            }
        }
    }
    

    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == DetailViewController.SegueIdentifier {
            let controller = segue.destination as! DetailViewController
            controller.detailViewModel =
                nasaViewModel.bindToDetailViewModel(nasa: collectionDataSource.getSelectObject())
                
        }
    }
}


