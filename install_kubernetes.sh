sudo apt-get update
sudo apt-get upgrade
curl -s <https://packages.cloud.google.com/apt/doc/apt-key.gpg> | sudo apt-key add -
cat <<EOF | sudo tee /etc/apt/sources.list.d/kubernetes.list
deb <https://apt.kubernetes.io/> kubernetes-xenial main
EOF
sudo apt-get update
apt-get install -y kubelet=1.17.3.-00 kubeadm=1.17.3.-00 kubectl=1.17.3.-00
# 패키지가 자동으로 설치, 업그레이드, 제거되지 않도록 hold함.
sudo apt-mark hold kubelet kubeadm kubectl
# 설치 완료 확인
kubeadm version
kubelet --version
kubectl version
